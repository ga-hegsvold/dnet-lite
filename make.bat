@ECHO OFF

IF [%1]==[] GOTO:USAGE
IF [%2]==[] GOTO:USAGE

SET APP_PATH="%GOOGLE_DRIVE_ROOT%\apps"

REM SET do_DB=..\xsltproc\xsltproc -o %2.xml xsd2db_%3.xsl %2.xsd
REM HTML transformation is currently not working
SET do_HTML=java -cp %APP_PATH%\saxon\saxon9he.jar net.sf.saxon.Transform -t -s:%2.xml -xsl:xsl\customization.HTML.xsl -o:%2.html
REM SET do_FO=java -cp "%APPS_PATH%\saxon\saxon9he.jar" net.sf.saxon.Transform -t -s:%2.xml -xsl:xsl\customization.FO.xsl -o:%2.fo
SET do_FO=%APP_PATH%\xsltproc\xsltproc -o %2.fo xsl\customization.FO.xsl %2.xml
SET do_PDF=%APP_PATH%\fop\fop -fo %2.fo -pdf %2.pdf
SET do_RTF=%APP_PATH%\fop\fop -fo %2.fo -rtf %2.rtf

IF /I %1==HTML GOTO Make_HTML
IF /I %1==FO   GOTO Make_FO
IF /I %1==PDF  GOTO Make_PDF
IF /I %1==RTF  GOTO Make_RTF
IF /I %1==ALL  GOTO Make_ALL

GOTO:USAGE

:USAGE
echo make ^<option^> ^<filename without extension^>
echo  options:
echo    HTML  Hyper Text Markup Language
echo    FO    Formatting Objects (needed for PDF and RTF output)
echo    PDF   Portable Document Format
echo    RTF   Rich Text Format
echo    ALL   All of the above
GOTO:DONE

:Make_HTML
echo Generating %1
echo  generating %2.html
%do_HTML%
GOTO:DONE

:Make_FO
echo Generating %1
echo  generating %2.fo
%do_FO%
GOTO:DONE

:Make_PDF
echo Generating %1
echo.
echo  generating %2.fo
echo  *** %do_FO%
%do_FO%
echo.
echo  generating %2.pdf
echo  *** %do_PDF%
%do_PDF%
GOTO:DONE

:Make_RTF
echo Generating %1
echo  generating %2.fo
%do_FO%
echo  generating %2.rtf
%do_RTF%
GOTO:DONE

:Make_ALL
echo Generating %1
echo  generating %2.html
%do_HTML%
echo  generating %2.fo
%do_FO%
echo  generating %2.pdf
%do_PDF%
echo  generating %2.rtf
%do_RTF%
GOTO:DONE

:DONE
echo.
echo All done

GOTO:EOF

:EOF
