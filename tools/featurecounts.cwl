#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

id: featurecounts
label: featureCounts is a very efficient read quantifier.
doc: |+
  featureCounts is a very efficient read quantifier. It can be used to summarize RNA-seq reads and gDNA-seq reads to a variety of genomic features such as genes, exons, promoters, gene bodies and genomic bins. It is included in the Bioconductor Rsubread package and also in the SourceForge Subread package.

  External links:
  Tool homepage: http://bioconductor.org/packages/release/bioc/html/Rsubread.html
  bio.tools entry: featurecounts

hints:
  SoftwareRequirement:
    packages:
      subread:
        version: ["1.5.3"]

baseCommand: featureCounts

inputs:
  # Input files
  annotation:
    type: File
    label: name of an annotation file
    inputBinding:
      prefix: '-a'
  input:
    type: File
    label: BAM or SAM file
    inputBinding:
      position: 4
  # Main options
  feature_type:
    type: string?
    label: specify feature type in annotation file
    default: exon
    inputBinding:
      prefix: '-t'
  attribute_type:
    type: string?
    label: specify attribute type in annotation file
    default: gene_id
    inputBinding:
      prefix: '-g'
  output_name:
    type: string
    label: name of the output file
    inputBinding:
      prefix: '-o'
  # Advanced parameters
  count_feature:
    type: boolean?
    label: perform read counting at feature level
    inputBinding:
      prefix: '-f'
  assign_all_overlap:
    type: boolean?
    label: assign reads to all their overlapping meta-features
    inputBinding:
      prefix: '-O'
  count_multi:
    type: boolean?
    label: mutli-mapping reads will also be counted
    inputBinding:
      prefix: '-M'
  # -- Strandness
  strandness:
    type: int?
    label: 0 (unstranded), 1 (stranded), 2 (reversely stranded)
    inputBinding:
      prefix: '-s'
  # -- Parameters specific to paired end reads
  count_fragments:
    type: boolean?
    label: fragments are counted instead of reads
    inputBinding:
      prefix: '-p'
  only_both_aligned:
    type: boolean?
    label: count only when both ends are aligned
    inputBinding:
      prefix: '-B'
  min_frag_len:
    type: int?
    label: minimum fragment/template length
    default: 50
    inputBinding:
      prefix: '-d'
  max_frag_len:
    type: int?
    label: maximum fragment/template length
    default: 600
    inputBinding:
      prefix: '-D'

outputs:
  counts:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
  summary:
    type: File
    outputBinding:
      glob: $(inputs.output_name).summary

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/

s:about: featureCounts is a very efficient read quantifier. It can be used to summarize
  RNA-seq reads and gDNA-seq reads to a variety of genomic features such as genes,
  exons, promoters, gene bodies and genomic bins. It is included in the Bioconductor
  Rsubread package and also in the SourceForge Subread package.
s:keywords: [edam:topic_3168]
s:name: FeatureCounts
s:programmingLanguage: [R, C]
s:publication: []
s:url: http://bioconductor.org/packages/release/bioc/html/Rsubread.html

