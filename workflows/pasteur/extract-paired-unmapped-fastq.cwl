#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  # Input BAM file (with unmapped reads)
  align_file: File

  # samtools view 
  samtools_outputbam: boolean
  samtools_keep_flag: int
  samtools_outname: string

  # bedtools bam2fastq parameters
  fqr1: string
  fqr2: string

outputs:
  fastq_R1:
    type: File
    outputSource: bamtofastq/fastq_r1
  fastq_R2:
    type: File
    outputSource: bamtofastq/fastq_r2

steps:
  extract_unmapped:
    run: ../../tools/samtools-view.cwl
    in:
      input: align_file
      isbam: samtools_outputbam
      readswithbits: samtools_keep_flag # read unmapped and mate unmapped
      output_name: samtools_outname
    out: [output]

  bamtofastq:
    run: ../../tools/bedtools-bam2fastq.cwl
    in:
      input: extract_unmapped/output
      fq: fqr1
      fq2: fqr2
    out: [fastq_r1, fastq_r2]