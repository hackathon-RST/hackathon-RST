"""Harrassment reporter at work and follow up on the status of each incident report."""

from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db
from model import (Users, UserType, Companies, Incidents, Transactions)

import os

app = Flask(__name__)
app.secret_key = key
app.jinja_env.undefined = StrictUndefined

@app.route('/')
def show_homepage():
    """Homepage to show login screen."""

    return render_template('homepage.html')

@app.route('/register', methods=['GET'])
def show_registration_form():
    """Page for new user registration."""

    return render_template('register.html')

@app.route('/user/create', methods=['POST'])
def create_new_user():
    """Creates new user to store in database."""

    user_fname = request.form.get('user_fname')
    user_lname = request.form.get('user_lname')
    user_name = request.form.get('user_name')
    password = request.form.get('password')

    #Queries user table in db for user_name provided by user.
    dbuser = Users.query.filter(Users.user_name == user_name).first()

    if dbuser:
        flash('This username has already been used.')
        return redirect('/register')
    else:
        user = Users(user_fname=user_fname,
                     user_lname=user_lname,
                     user_name=user_name,
                     password=password)
        db.session.add(user)
        db.session.commit()
        flash('You have been created!')
        session['user_id'] = user.user_id
        user_url_id = str(user.user_id) #typecasting as a string to add to URL
        return redirect('/users/' + user_url_id)


    




