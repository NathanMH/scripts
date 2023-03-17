import smtplib
from email.message import EmailMessage
import tweepy
import authentication

CONSUMER_KEY = authentication.CONSUMER_KEY
CONSUMER_SECRET = authentication.CONSUMER_SECRET
ACCESS_TOKEN = authentication.ACCESS_KEY
ACCESS_TOKEN_SECRET = authentication.ACCESS_SECRET

SEND_EMAIL_ADDRESS = authentication.SEND_EMAIL_ADDRESS
EMAIL_PASS = authentication.EMAIL_PASS
RECEIVE_EMAIL_ADDRESS = authentication.RECEIVE_EMAIL_ADDRESS

SUBJECT = "Noncerto just tweeted."

# Email
def send_email():
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.login(SEND_EMAIL_ADDRESS, EMAIL_PASS)

    BODY = '\r\n'.join(['To: %s' % RECEIVE_EMAIL_ADDRESS,
                        'From: %s' % SEND_EMAIL_ADDRESS,
                        'Subject: %s' % SUBJECT,
                      ])

    # server.sendmail(SEND_EMAIL_ADDRESS, RECEIVE_EMAIL_ADDRESS, BODY)
    server.sendmail(SEND_EMAIL_ADDRESS, authentication.TEST_RECEIVE_EMAIL_ADDRESS, BODY)

# Twitter
def authen():
    """ Authentication for Twitter. """
    auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
    api = tweepy.API(auth)
    return api

class MyStreamListener(tweepy.StreamListener):
    def on_status(self, status):
        send_email()


if __name__ == "__main__":
    API = authen()

    # Username: "noncerto"
    USERID = "2657045784"
    TEST_USERID = "575930104"

    myStreamListener = MyStreamListener()
    myStream = tweepy.Stream(auth=API.auth, listener=myStreamListener)
    # myStream.filter(follow=[USERID])

    # Test
    myStream.filter(follow=[TEST_USERID])