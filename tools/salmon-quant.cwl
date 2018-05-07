#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: salmon-quant
label: Salmon is a tool for quantifying the expression of transcripts using RNA-seq data
doc: |+
  Salmon is a tool for quantifying the expression of transcripts using RNA-seq data.
  Salmon uses new algorithms (specifically, coupling the concept of quasi-mapping with a two-phase inference procedure) to provide accurate expression estimates very quickly (i.e. wicked-fast) and while using little memory.
  Salmon performs its inference using an expressive and realistic model of RNA-seq data that takes into account experimental attributes and biases commonly observed in real RNA-seq data.

  External links:
  Tool homepage: https://combine-lab.github.io/salmon/

hints:
  SoftwareRequirement:
    packages:
      salmon:
        version: ["0.8.2"]
  ResourceRequirement:
    ramMin: $(inputs.memory)
    coresMin: $(inputs.runThreadN)

baseCommand: [salmon, quant]

inputs:
  # - Mandatory parameters
  index:
    type: string
    label: Index directory name
    inputBinding:
      prefix: --index
  libType:
    type: string
    default: A
    label: type of sequencing library from which the reads come
    inputBinding:
      prefix: --libType
  mates1:
    #format: edam:format_1930
    label: Nucleic acid sequence of R1
    type: File
    inputBinding:
      prefix: --mates1
  mates2:
    #format: edam:format_1930
    label: Nucleic acid sequence of R2
    type: File?
    inputBinding:
      prefix: --mates2
  numBootstraps:
    type: int
    default: 30
    inputBinding:
      prefix: --numBootstraps
  quantdir:
    type: string
    label: output directory for salmon results
    inputBinding:
      prefix: --output
  # - Advanced parameters
  runThreadN:
    type: int
    default: 1
    label: Number of threads to run Salmon
    inputBinding:
      prefix: --runThreadN
  memory:
    type: int
    default: 4096
    label: Memory to allocate while submitting job

outputs:
  #align_reads:
    #format: edam:format_3475
    #type: File
    #outputBinding:
      #glob: $(inputs.output_name)/quant.sf
  outdir:
    type: Directory
    outputBinding:
      glob: $(inputs.quantdir)

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:keywords: [edam:topic_0203]
s:name: salmon
s:publication:
- {id: http://dx.doi.org/10.1038/nmeth.4197}
s:url: https://combine-lab.github.io/salmon/
