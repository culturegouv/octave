# Docuteam Packer

## Configuration

|filename                          |used by Class |required |filename/path fixed |
|---                               |--- |
|docuteamPacker.properties         ||
|charConversionMap.properties      ||
|container-signature-20180920.xml  |ch.docuteam.tools.file.MetadataProviderDROID |
|crules.xml                        |ch.docuteam.actions.storage.FOXMLCreator |
|document-formats.xml              |ch.docuteam.converter.OOConverter |
|DROID_SignatureFile_V95.xml       |ch.docuteam.tools.file.MetadataProviderDROID |
|fileNameNormalizer.properties     ||
|filePreviewConfigurator.properties||
|jhove.conf                        |ch.docuteam.tools.file.MetadataProviderJHOVE, ch.docuteam.tools.file.FileChecksumCalculator? (propably only a obsolote JavaDoc) |
|levels_BAR.xml                    |ch.docuteam.actions.ingest.BARSIPConverter |
|levels.xml                        |ch.docuteam.aipcreatorETH.ingest, ch.docuteam.darc.mdconfig.LevelOfDescription |
|log4j2.xml                        |ch.docuteam.tools.out.Logger, ch.docuteam.actions.util.Log4jFileAppender (deprecated and no longer used)|
|migration-config.xml              |ch.docuteam.converter.FileConverter |
|pdfToolsConverterWS.properties    |ch.docuteam.converter.PDFToolsConverterWSClient |

The configuration files are loaded using the
[ConfigurationFileLoader](https://bitbucket.org/docuteam/cosmos/src/master/docuteam-tools/src/main/java/ch/docuteam/tools/file/ConfigurationFileLoader.java).
It loads the configuration file from the config directory (defined with the
command line argument`configDir`), if file exists. If it does not exist, it
returns the default configuration from the classpath.

:warning: For now, the ConfigurationFileLoader is only used for the following
files (in the future it will be used for all configuration files, see [here](https://docuteam.atlassian.net/browse/COSMOS-479)):
* docuteamPacker.properties

## Run packer in Eclipse with the default configuration

Main class: ch.docuteam.packer.gui.launcher.LauncherView

Programm arguments: NONE
VM arguments: -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
Configuration file: cosmos\docuteam-packer\src\main\resources\config/docuteamPacker.properties

Run in debugging mode by setting in docuteamPacker.properties:
- docuteamPacker.isDevMode = true
- create copy of docuteamPacker.example.properties to docuteamPacker.properties
- create copy of levels.example.xml to levels.xml

switch on/off reports, when running from eclipse, by adding/outcommenting to docuteamPacker.properties:
docuteamPacker.reportsDir.Win = ./src/main/resources/templates/reports


## Run packer in eclipse with external configuration
s. wiki: running_apps_in_eclipse_with_external_configuration


## Testing

### Run Tests within Docker

Run the tests using docker with

```
docker-compose run --rm tests
```

### Run Swift GUI tests

Click on the "LauncherViewSwingIT.java" file in Java and select "Run as" -> "JUnit test".

#### Mac OS X

You're IDE needs to be able to control your mouse and keyboard to successfully run the tests. Try an initial run according to the instructions
above. It'll fail because your IDE won't have the permissions yet but one run is required, else the option in the system preferences won't
be shown. Open the System preferences, open "Security & Privacy", click on the "Privacy" tab , click on "Accessibility" and check either
"IntelliJ" or "Eclipse" on the right side.

## Configuration Notes

Sample files for skos and csv files:
cosmos\docuteam-packer\src\main\resources\config/skos -> SVN/configurations/656/client-apps/packer/src/main/resources/docuteam+packer.app/Contents/docuteam+packer/config/skos
cosmos\docuteam-packer\src\main\resources\config/csv -> SVN/configurations/656/client-apps/packer/src/main/resources/docuteam+packer.app/Contents/docuteam+packer/config/csv

Logger configuration:
cosmos\docuteam-packer\src\main\resources\log4j2.xml

Default levels.xml
cosmos\docuteam-packer\src\main\resources\config\levels.xml

FileNameNormalizer uses:
cosmos\docuteam-packer\src\main\resources\config\fileNameNormalizer.properties
cosmos\docuteam-packer\src\main\resources\config\charConversionMap.properties
