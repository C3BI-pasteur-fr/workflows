#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: raxml
label: RAxML (Randomized Axelerated Maximum Likelihood) A tool for Phylogenetic Analysis
  and Post-Analysis of Large Phylogenies.
doc: |+
  RAxML (Randomized Axelerated Maximum Likelihood) A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies.

  External links:
  Tool homepage: http://sco.h-its.org/exelixis/web/software/raxml/
  bio.tools entry: raxml

hints:
  SoftwareRequirement:
    packages:
      - package: RAxML

baseCommand: raxmlHPC

inputs:
  alignment:
    type: File
    inputBinding:
      prefix: -s
    label: Sequence alignment
  random_seed:
    type: int
    inputBinding:
      prefix: -p
  model:
    type: string
    inputBinding:
      prefix: -m
  name:
    type: string
    inputBinding:
      prefix: -n

outputs:
  tree:
    type: File
    outputBinding:
      glob: "*_bestTree.$(inputs.name)"

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

s:about: RAxML (Randomized Axelerated Maximum Likelihood) A tool for Phylogenetic
  Analysis and Post-Analysis of Large Phylogenies.

s:keywords:
- edam:topic_3293
- edam:topic_0080

s:name: RAxML

s:publication:
- id: http://dx.doi.org/doi:10.1093/bioinformatics/btu033

s:url: http://sco.h-its.org/exelixis/web/software/raxml/

