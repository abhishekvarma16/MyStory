'''
Created on 02-Feb-2018

@author: dylan
'''
import mysql.connector as ms
from flask import Flask,render_template,request
app = Flask(__name__)
#cnx = ms.connect(unix_socket= '/Applications/MAMP/tmp/mysql/mysql.sock', user='root', password='root', host='localhost', database='snp',)



@app.route('/hello')
def hello():
    return 'Hello, World'

@app.route('/index.html', methods = ['GET', 'POST'])
def login():
	if request.method == 'POST':
		if request.form['submit'] == 'Sign Up':
			if checkSignUp(request.form['usernameUP'],request.form['emailup'],request.form['passup'],request.form['repassup']):
				return render_template('home.html')
				flash('Inside signup')
				return render_template('home.html')
			else:
				flash('Inside signup else')
		elif request.form['submit'] == 'Sign IN':
			pass # do something else
	else:
		pass
	return render_template('index.html')


def checkSignUp(a,b,c,d):

  	cnx = ms.connect(user='root', password='root',host='localhost', database='mystory')
  	try:
  		return true
  		cur=cnx.cursor()
  		cur.execute("Select * from people ;")
  		d= cur.fetchall()
  		cnx.commit()
	except:
		flash('chutiyaypa ')
		return false

@app.route('/home.html')
def home():
   return render_template('home.html')

'''@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % username

@app.route('/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
    return 'Post %d' % post_id   

@app.route('/database/<sk>')
def db_access(sk):
    #sk is not used
    try:
        cur=cnx.cursor()
        
        cur.execute("Select * from enquiry ;")
        d= cur.fetchall()
        
        cnx.commit()  
        return
       
    <!DOCTYPE html>
<html>
<body>
<h1 style="font-size:100x;color:blue;text-align:center;"> Here's your data <del>CUNT</del> TWAT!!!</h1>
<h3 style="font-size:40x;"> {}</h2>
<br>
<br>
<h1 style="font-size:100x;color:blue;text-align:center;"> <sup>Whamen</sup> and <sub>Men</sub></h1>
</body>
</html>
        .format(str(d))
        
    except ms.Error as e:
        print("Something went wrong: {}".format(e))    
    
    '''    
if __name__ == '__main__':
    app.run(debug=True)
    
    
    
    
    
    
    