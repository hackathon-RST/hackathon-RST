"""Harrassment reporter at work and follow up on the status of each incident report."""

from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db
from model import (Users, UserType, Companies, Incidents, Transactions)

import os

key= os.environ['FLASK_SECRET']

app = Flask(__name__)
app.secret_key = key
app.jinja_env.undefined = StrictUndefined

@app.route('/')
def show_homepage():
    """Homepage to show login screen."""

    return render_template('main.html')

@app.route('/register', methods=['GET'])
def show_registration_form():
    """Page for new user registration."""

    return render_template('register.html')

@app.route('/user/create', methods=['POST'])
def create_new_user():
    """Creates new user to store in database."""

    user_name = request.form.get('username')
    password = request.form.get('password')
    user_type = request.form.get('user-type')

    #Queries user table in db for user_name provided by user.
    dbuser = Users.query.filter(Users.user_name == user_name).first()

    if dbuser:
        flash('This username has already been used.')
        return redirect('/register')
    else:
        dbuser_type = UserType.query.filter(UserType.user_type == user_type).first()
        dbuser_type_id = dbuser_type.user_type_id
        user = Users(user_name=user_name,
                     password=password,
                     user_type_id=dbuser_type_id)
        db.session.add(user)
        db.session.commit()
        flash('You have been created!')
        session['user_id'] = user.user_id
        user_url_id = str(user.user_id) #typecasting as a string to add to URL
        return redirect('/users/' + user_url_id)


@app.route('/login', methods=['GET', 'POST'])
def login():
    """User login."""

    if request.method == 'POST':
        user_name = request.form.get('username')
        password = request.form.get('password')

        dbuser = Users.query.filter(Users.user_name == user_name).first()

        if dbuser and dbuser.password == password:
            flash('Log in successful!')
            user_url_id = dbuser.user_id
            session['user_id'] = user_url_id
            user_url_id = str(dbuser.user_id)
            return redirect('/users/' + user_url_id)
        else:
            flash('User name and password combination incorrect.')
            return redirect('/login')
    else:
        return render_template('login.html')


@app.route('/users/<user_id>')
def show_user_info(user_id):
    """Show general user information"""

    if 'user_id' in session:
        user_details = Incidents.query.filter(Incidents.user_id == user_id).all()
        return render_template('user_detail.html',
                               user_details=user_details)
    else:
        flash('You are not logged in!')
        return redirect('/login')


@app.route('/createincident', methods=['GET'])
def create_new_incident():
    """Create new incident to track/submit to HR."""

    if 'user_id' in session:
        return render_template('newincident.html')
    else:
        flash('Please log in to report an incident.')
        return redirect('/login')


@app.route('/save_incident', methods=['POST'])
def save_incident():
    """Save incident to database."""

    if 'user_id' in session:
        user = session['user_id']
        user_details = Users.query.filter(Users.user_id == user_id).first()
        




@app.route('/incidents')
def show_inc_details():
    """Show details on each incident."""


    return render_template('incidents.html')


@app.route('/logout')
def logout():
    """Logout of session."""

    session.pop('user_id', None)
    flash('You are now logged out.')
    return redirect('/login')

############################################## 
if __name__ == '__main__':
    connect_to_db(app)
    #Flask debugger line below. Comment out when not troubleshooting.
    app.debug = True
    DebugToolbarExtension(app)

    app.run(debug=True, host='0.0.0.0')



