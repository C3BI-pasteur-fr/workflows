#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  # Input BAM file (with unmapped reads)
  align_file: File

outputs:
  fastq_R1:
    type: File
    outputSource: bamtofastq/fq1
  fastq_R2:
    type: File
    outputSource: bamtofastq/fq2

steps:
  extract_unmapped:
    run: ../../tools/samtools-view.cwl
    in:
      input: align_file
      isbam: true
      readswithbits: "12" # read unmapped and mate unmapped
      output_name: unmapped.bam
    out: [unmapped_reads]

  bamtofastq:
    run: ../../tools/bedtools-bam2fastq.cwl
    in:
      input: extract_unmapped/unmapped_reads
      fq: unmapped_R1.fq
      fq2: unmapped_R2.fq
    out: [fq1, fq2]