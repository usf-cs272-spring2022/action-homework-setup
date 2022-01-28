echo ""
echo "Checking Warnings..."

export JAVA_HOME="${JAVA_HOME}"

mvn -f pom.xml -ntp "-DcompileOptionXlint=-Xlint:all" "-DcompileOptionXdoclint=-Xdoclint:all/private" "-DcompileOptionFail=true" "-Dmaven.compiler.showWarnings=true" clean compile

if [[ $? -ne 0 ]];
then
  echo "COMPILE_WARNING=1" >> $GITHUB_ENV
fi

exit 0;
