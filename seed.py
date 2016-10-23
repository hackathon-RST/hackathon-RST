from model import connect_to_db, db, Users, UserType, Companies, Incidents

from server import app

connect_to_db(app)

db.drop_all()

db.create_all()

def load_users():
	"""load all users from seed file"""
	with open('./seed_data/users.tsv','r+') as data:
		for row in data:
			row = row.rstrip()
			user_name, password, user_type_id = row.split("\t")

			user= Users(user_name=user_name,
						password=password,
						user_type_id= user_type_id)
			db.session.add(user)
			db.session.commit()

def load_user_type():
	"""load two types of users"""
	with open('./seed_data/user_type.tsv', 'r+') as data:
		for row in data:
			row = row.rstrip()
			user_type = row.split("\t")

			user_type = UserType(user_type=user_type)

			db.session.add(user_type)
			db.session.commit()

def load_companies():
	"""load companies into database"""

	with open('./seed_data/companies.tsv', 'r+') as data:
		for row in data:
			row = row.rstrip()
			name, address, hr_contact_info = row.split('\t')
			companies = Companies(name=name,
								address=address,
								hr_contact_info=hr_contact_info)
			db.session.add(companies)
			db.session.commit()

def load_incidents():
	"""load all Incidents"""
	with open('./seed_data/incidents.tsv', 'r+') as data:
		for row in data:
			row = row.rstrip()
			incidents = Incidents(user_id=user_id,
								company_id=company_id,
								reported_at=reported_at,
								transaction_id=transaction_id)
			db.session.add(incidents)
			db.session.commit()

if __name__ == '__main__':
	load_user_type()
	load_users()
	load_companies()
	# load_incidents()

