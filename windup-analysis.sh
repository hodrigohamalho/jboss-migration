#!/bin/sh
windup_exec=./rhamt-cli-4.0.0.Final/bin/rhamt-cli

rm -rf reports

for appbinary in binarios/*; do
  appname=`basename $appbinary`
  appname=`echo $appname | sed 's/\./_/g'`
  outputDir=reports/$appname

  echo "Executando o Red Hat Application Migration Toolkit para aplicacao: $appname..."
  echo ''

  mkdir -p $outputDir

  $windup_exec -b --enableTattletale --target eap7 --input $appbinary --output $outputDir > reports/${appname}.log
done

