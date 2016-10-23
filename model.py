from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class Users(db.Model):
	"""User registration info"""

	__tablename__ = "users"

	user_id = db.Column(db.Integer, autoincrement = True, primary_key = True)
	user_name = db.Column(db.String(64), nullable = False)
	password = db.Column(db.String(64), nullable = False)
	user_type_id = db.Column(db.Integer,db.ForeignKey('user_type.user_type_id'), nullable = False)
	# phone_num = db.Column(db.String(20), nullable = False)

class UserType(db.Model):
	"""two types of users 1. women with complaint 2.HR/company"""

	__tablename__ = "user_type"

	user_type_id = db.Column(db.Integer,autoincrement = True, primary_key = True)
	user_type = db.Column(db.String(15), nullable = False)
	# r = dd.Column(db.String(15), nullable = False)

class Companies(db.Model):
	"""Companies registration information"""

	__tablename__ = "companies"

	company_id = db.Column(db.Integer, autoincrement = True, primary_key = True)
	name = db.Column(db.String(64), nullable = False)
	address = db.Column(db.String(64), nullable = False)
	hr_contact_info = db.Column(db.String(64), nullable = False)

class Incidents(db.Model):
	"""information on the Incidents reported """

	__tablename__ = "incidents"

	incident_id = db.Column(db.Integer, autoincrement = True, primary_key = True)
	user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
	company_id = db.Column(db.Integer, db.ForeignKey('companies.company_id'))
	reported_at = db.Column(db.String(64), nullable = False)
	transaction_id = db.Column(db.Integer, db.ForeignKey('transactions.trans_id'))
	#status = db.Column(db.String(64), nullable = True)
	
class Transactions(db.Model):
	"""notations and comments made on each incident"""

	__tablename__ = "transactions"

	trans_id = db.Column(db.Integer, autoincrement = True, primary_key = True)
	#incident_id = db.Column(db.Integer, db.ForeignKey('incidents.incident_id'))
	user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
	timestamp = db.Column(db.String(64), nullable = False)
	notes = db.Column(db.String(100), nullable= False)

def connect_to_db(app):
	"""Connect the database to our Flask app."""

	app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///hackathon'
	
	db.app = app
	db.init_app(app)
	db.create_all()

if __name__ == "__main__":
    
    from server import app
    connect_to_db(app)
    print "Connected to DB."


