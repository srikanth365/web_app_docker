node {
    def buildnumber= BUILD_NUMBER
    stage ("clone source code from git"){
        git url: 'https://github.com/srikanth365/web_app_docker.git', branch: 'master'
    }
    stage ("Maven Clean Package"){
        def mavenhome= tool name: "maven", type: "maven"
        
        sh "${mavenhome}/bin/mvn clean package"
    }
    stage("build docker image") {
        sh "docker build -t 1081992/web_app_docker:${buildnumber} ."
    }
    stage ("push docker image to dockerhub"){
        withCredentials([string(credentialsId: 'docker_pwd', variable: 'docker_pwd')]) {
       sh "docker login -u 1081992 -p ${docker_pwd}"
       
}
      sh "docker push 1081992/web_app_docker:${buildnumber}"
    }
    stage ("deploy docker container in docker server"){
        sshagent(['sshagent']) {
     sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.46.112 docker rm -f webapp || true"
     sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.46.112 docker run -d -p 8080:8080 --name webapp 1081992/web_app_docker:${buildnumber}"
}
    }
}
