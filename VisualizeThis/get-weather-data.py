import urllib2
from BeautifulSoup import BeautifulSoup

f = open('wunder.data.txt', 'w')
for m in range(1, 13):
	for d in range(1, 32):

		#check if gone through month
		if (m == 2 and d > 28):
			break
		elif (m in [4,6,9, 11] and d > 30):
			break

		#Open wunder url
		timestamp = '2009' + str(m) + str(d)
		print "getting data for " + timestamp
		url = "http://www.wunderground.com/history/airport/KSFO/2010" + str(m) + "/" +str(d) + "/DailyHistory.html"
		page = urllib2.urlopen(url)

		# Get temp from page
		soup = BeautifulSoup(page)

		# daytemp = soup.body.nobr.b.string
		dayTemp = soup.findAll(attrs={"class":"nobr"})[5].span.string

		# Format month for timestamp
		if len(str(m)) < 2:
			mStamp = "0" + str(m)
		else:
			mStamp = str(m)
		# Format day for timestamp
		if len(str(d)) < 2:
			dStamp = "0" + str(d)
  		else:
  			dStamp = str(d)

		# build timestamp
		timestamp = "2009" + mStamp + dStamp	

		# write timestamp and temp to file
		f.write(timestamp + "," + dayTemp + '/n')

f.close()