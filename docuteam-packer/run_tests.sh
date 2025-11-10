#!/usr/bin/env bash
set -e

echo "build everything necessary to run the packer integration tests"
mvn -B --no-snapshot-updates \
    -DskipITs=true \
    -DskipGUITests=true \
    -Dcheckstyle.skip \
    -Dmaven.test.skip=true \
    -pl docuteam-packer \
    --also-make \
    install

echo "run the tests"
mvn -B --no-snapshot-updates \
    -pl docuteam-packer \
    -DexcludedGroups=ch.docuteam.test.BlackBoxLinux \
    -Dorg.assertj.swing.delay.between_events=500 \
    -Dorg.assertj.swing.timeout.submenu=500 \
    -Dorg.assertj.swing.allow_click_on_disabled_component=false \
    -Dfailsafe.rerunFailingTestsCount=3 \
    verify
