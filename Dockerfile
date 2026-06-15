FROM jenkins/jenkins:jdk21
USER jenkins
RUN jenkins-plugin-cli --plugins "workflow-aggregator git docker-workflow"