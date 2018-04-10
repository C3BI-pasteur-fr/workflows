#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: mafft_ebi
label: MAFFT (Multiple Alignment using Fast Fourier Transform) is a high-speed multiple
  sequence alignment program.
doc: |+
  MAFFT (Multiple Alignment using Fast Fourier Transform) is a high-speed multiple sequence alignment program.

  External links:
  Tool homepage: https://www.ebi.ac.uk/Tools/msa/mafft/
  bio.tools entry: mafft_ebi

hints:
  SoftwareRequirement:
    packages:
    - package: fasta
    - package: mafft

baseCommand: mafft

inputs:
  sequences:
    type: File
    inputBinding:
      position: 1
  auto:
    type: boolean?
    inputBinding:
      prefix: --auto
      
outputs:
  alignment:
    type: stdout

stdout: mafft_alignment.fa

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:about: MAFFT (Multiple Alignment using Fast Fourier Transform) is a high-speed multiple
  sequence alignment program.

s:keywords:
- edam:topic_0080
- edam:topic_0121
- edam:topic_0622

s:name: MAFFT (EBI)

s:publication:
- id: http://dx.doi.org/10.1093/bioinformatics/btw412

s:url: https://www.ebi.ac.uk/Tools/msa/mafft/
