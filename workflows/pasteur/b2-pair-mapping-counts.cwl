#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  # Input files
  r1: File
  r2: File
  b2index: string

  # bowtie2
  bowtie2_mismatch: int
  sam_name: string

  # samtools view 
  samtools_outputbam: boolean
  samtools_outname: string

outputs:
  bam:
    type: File
    outputSource: samtobam/output

steps:
  mapping:
    run: ../../tools/bowtie2.cwl
    in:
      index: bt2index
      fq1: r1
      fq2: r2
      output_name: sam_name
    out: [align_reads]

  samtobam:
    run: ../../tools/samtools-view.cwl
    in:
      input: mapping/align_reads
      output_name: samtools_outname
      isbam: samtools_outputbam
    out: [output]