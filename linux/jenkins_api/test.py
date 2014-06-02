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

#j = jenkins.Jenkins('http://10.211.55.6:8080/jenkins','','')
#print j.get_jobs()
#j.build_job('project1')
#print j.job_exists('1project1')
#print j.api.get_latest_complete_build('http://10.211.55.6:8080/jenkins','project1')
class JenkinsMgr:
    def __init__(self, url, username, userpwd):
        self.m_url = url
        self.m_username = username
        self.m_userpwd = userpwd
        self.j = jenkins.Jenkins(self.m_url,self.m_username,self.m_userpwd)
        return
    def test(self):
        print "xxx"
        return
    def Getconfig(self,objname):
        self.j.get_job_config(objname)
    def CreateJob(self, objname):
        bExist = self.j.job_exists(objname)
        if bExist == True:
            return False
        else:
            #json="{\"parameter\": [{\"name\": \"taskfile\", \"value\": \"$taskfile\"},{\"name\": \"task\", \"value\": \"$task\"},{\"name\": \"jobParameters\", \"value\": \"$jobargs\"}]}"
            json='{\"parameter\": [{\"name\":\"FILE_LOCATION_AS_SET_IN_JENKINS\", \"file\":\"file0\"}]}'
            return self.j.create_job('test',json);




if __name__ == "__main__":
    jenMgr = JenkinsMgr('http://10.211.55.6:8080/jenkins','','')
    print jenMgr.Getconfig('test')

