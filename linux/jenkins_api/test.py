import jenkins
#import pycurl
#url = "jenkins@10.211.55.6:/home/jenkins/submd/repos/project1.git"
#crl = pycurl.Curl()
#crl.setopt(pycurl.VERBOSE,1)
#crl.setopt(pycurl.FOLLOWLOCATION,1)
#crl.setopt(pycurl.MAXREDIRS,5)
#crl.setopt(pycurl.USERPWD,"jenkins:jenkins")
#crl.setopt(pycurl.CONNECTTIMEOUT,60)
#crl.setopt(pycurl.TIMEOUT,300)
#crl.setopt(pycurl.HTTPPROXYTUNNEL,1)
#crl.fp = StringIO.StringIO()
#crl.setopt(pycurl.URL,url)
#crl.setopt(crl.WRITEFUNCTION, crl.fp.write)
#crl.perform()
#ret = crl.fp.getvalue()

j = jenkins.Jenkins('http://10.211.55.6:8080/jenkins','','')
print j.get_jobs()
j.build_job('project1')

