#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: goalign
label: manipulation of multiple alignments.

hints:
  SoftwareRequirement:
    packages:
      - package: goalign

baseCommand: ["goalign", "reformat"]

inputs:
  conversion:
    type: string
    inputBinding:
      position: 1
    label: type to convert to
  alignment:
    type: File
    inputBinding:
      prefix: -i

outputs:
  converted:
    type: stdout

stdout: converted_alignment.$(inputs.conversion)