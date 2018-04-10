#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: noisy
label: Cleaning aligned sequences.

hints:
  SoftwareRequirement:
    packages:
      - package: Noisy

baseCommand: noisy

inputs:
  alignment:
    type: File
    format: edam:format_1929
    inputBinding:
      position: 1
    label: Sequence alignment
  cutoff:
    type: string?
    inputBinding:
      prefix: --cutoff
  seqtype:
    type: string?
    inputBinding:
      prefix: --seqtype

outputs:
  clean_alignment:
    type: File
    format: edam:format_1929
    label: Cleaned sequence alignment
    outputBinding:
      glob: "*.fas"

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

s:about: Cleaning aligned sequences.

s:keywords:
- edam:topic_0003

s:name: noisy

s:publication:
- id: http://dx.doi.org/10.1186/1748-7188-3-7
