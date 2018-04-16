#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: bowtie2
label: Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing
  reads to long reference sequences.
doc: |+
  Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome, its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes.

  External links:
  Tool homepage: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
  bio.tools entry: bowtie2

hints:
  SoftwareRequirement:
    packages:
      bowtie2:
        version: ["2.1.0"]

baseCommand: bowtie2-build

inputs:
  # Input and output files
  index:
    type: File
    label: Index name of reference genome
    inputBinding:
      prefix: '-x'
  fq1:
    format: edam:format_1930
    label: Nucleic acid sequence of R1
    type: File
    inputBinding:
      prefix: '-1'
  fq2:
    format: edam:format_1930
    label: Nucleic acid sequence of R2
    type: File?
    inputBinding:
      prefix: '-2'
  output_name:
    label: Name of output SAM file
    type: string
    inputBinding:
      prefix: '-S'
  # Options
  allowed_seed_mismatch:
    type: int?
    default: 0
    inputBinding:
      prefix: '-N'

outputs:
  align_reads:
    #format: edam:format_2573
    type: File
    outputBinding:
      glob: $(inputs.output_name)

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:about: 'Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing
  reads to long reference sequences. It is particularly good at aligning reads of
  about 50 up to 100s or 1,000s of characters, and particularly good at aligning to
  relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM
  Index to keep its memory footprint small: for the human genome, its memory footprint
  is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment
  modes.'
s:keywords: [edam:topic_0102]
s:name: bowtie2
s:publication:
- {id: http://dx.doi.org/10.1038/nmeth.1923}
s:url: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml