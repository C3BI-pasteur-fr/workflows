#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  # Input BAM file (with unmapped reads)
  align_file: File

  # samtools view parameters
  samtools_outname: "unmapped.bam"

  # bedtools bam2fastq parameters
  fqr1: "unmapped_R1.fq"
  fqr2: "unmapped_R2.fq"

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
      readswithbits: 12 # read unmapped and mate unmapped
      output_name: samtools_outname
    out: [output]

  bamtofastq:
    run: ../../tools/bedtools-bam2fastq.cwl
    in:
      input: extract_unmapped/unmapped_reads
      fq: fqr1
      fq2: fqr2
    out: [fastq_r1, fastq_r2]