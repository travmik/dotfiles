export PATH="/bin:/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"
# Customize to your needs...
# export ANT_HOME=~/env/ant/libexec
# export ANT_HOME=/Users/travmik/projects/EPAM/ATMO/hybris/bin/platform/apache-ant-1.8.2/
export ANT_HOME=/Users/travmik/projects/EPAM/ATMO/hybris5/bin/platform/apache-ant-1.9.1
export ANT_OPTS="-Xmx1536m -XX:MaxPermSize=4096m"
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m -Dfile.encoding=UTF-8"
export MAVEN_HOME=~/env/maven/libexec
export M2_HOME=~/env/maven/libexec
export GRADLE_HOME=~/env/gradle/libexec
export MYSQL_HOME=~/env/mysql
# export JAVA_HOME=~/env/java/Contents/Home
export JAVA_HOME=~/env/java8/Contents/Home
export JRE_HOME=$JAVA_HOME/jre
export HOMEBREW_TEMP=/private/tmp
export PATH=$MYSQL_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$ANT_HOME/bin:$JRE_HOME/bin:$PATH
export GROOVY_HOME=$GROOVY_HOME:/usr/local/Cellar/groovy/2.1.1/libexec
export ATMO_HYBRIS_HOME=/Users/travmik/projects/EPAM/ATMO/hybris4

# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/travmik/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
export HYBRIS_HOME=/Users/travmik/projects/EPAM/ATMO/hybris4
export FGL_HOME=/Users/travmik/projects/EPAM/ATMO/atmo-ecom


export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
