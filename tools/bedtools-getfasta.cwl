#!/usr/bin/env cwl-runner

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
  doap: http://usefulinc.com/ns/doap#
  adms: http://www.w3.org/ns/adms#
  dcat: http://www.w3.org/ns/dcat#
  edam: http://edamontology.org/

$schemas:
- http://dublincore.org/2012/06/14/dcterms.rdf
- http://xmlns.com/foaf/spec/20140114.rdf
- http://usefulinc.com/ns/doap#
- http://www.w3.org/ns/adms#
- http://www.w3.org/ns/dcat.rdf
- http://edamontology.org/EDAM.owl

cwlVersion: v1.0
class: CommandLineTool

adms:includedAsset:
  doap:name: bedtools
  doap:description: |
    A software suite for the comparison, manipulation and annotation of genomic features in browser extensible data (BED) and general feature format (GFF) format.
    BEDTools also supports the comparison of sequence alignments in BAM format to both BED and GFF features.
    The tools are extremely efficient and allow the user to compare large datasets (e.g. next-generation sequencing data) with both public and custom genome annotation tracks.
    BEDTools can be combined with one another as well as with standard UNIX commands, thus facilitating routine genomics tasks as well as pipelines that can quickly answer intricate questions of large genomic datasets.
  doap:homepage: http://bedtools.readthedocs.org
  doap:repository:
  - class: doap:GitRepository
    doap:location: https://github.com/arq5x/bedtools2
  doap:release:
  - class: doap:Version
    doap:revision: 2.25.0
  doap:license: GPLv2
  doap:category: commandline tool
  doap:programming-language: C++
  foaf:publications:
  - id: urn:pmid:20110278
    foaf:title: 'Aaron R. Quinlan, Ira M. Hall (2010) BEDTools: a flexible suite of
      utilities for comparing genomic features. Bioinformatics, 26(6) 841-842, http://dx.doi.org/10.1093/bioinformatics/btq033'
    foaf:homepage: http://bioinformatics.oxfordjournals.org/content/26/6/841
  doap:maintainer:
  - class: foaf:Person
    foaf:name: Aaron R. Quinlan
    foaf:mbox: aaronquinlan at gmail.com
    dct:isPartOf:
    - class: foaf:Organization
      foaf:name: Department of Biochemistry and Molecular Genetics, University of
        Virginia School of Medicine
    - class: foaf:Organization
      foaf:name: Center for Public Health Genomics, University of Virginia, Charlottesville,
        VA 22908, USA
doap:name: bedtools-getfasta.cwl
dcat:downloadURL: https://github.com/C3BI-pasteur-fr/workflows/edit/master/tools/bedtools-getfasta.cwl
doap:maintainer:
- class: foaf:Organization
  foaf:name: Bioinformatics and Biostatistics HUB, C3BI (USR 3756 Institut Pasteur et CNRS), Paris, France
  foaf:member:
  - class: foaf:Person
    id: https://orcid.org/0000-0002-6517-6934
    foaf:openid: https://orcid.org/0000-0002-6517-6934
    foaf:name: Kenzo-Hugo Hillion
    foaf:mbox: mailto:kenzo-hugo.hillion1@pasteur.fr

hints:
  SoftwareRequirement:
    packages:
      bedtools:
        version: ["2.25.0"]
#requirements:
#- $import: bedtools-docker.yml
#- class: InlineJavascriptRequirement

inputs:
  seqout: string
  fastainput:
    type: File
    inputBinding:
      position: 1
      prefix: -fi
    doc: |
      Input fasta file
  bed:
    type: File
    inputBinding:
      position: 2
      prefix: -bed
    doc: |
      Input BED/GFF/VCF file
  name:
    type: boolean?
    inputBinding:
      prefix: -name
    doc: |
      Use the “name” column in the BED file for
      the FASTA headers in the output FASTA file.
  tab:
    type: boolean?
    inputBinding:
      prefix: -tab
    doc: |
      Report extract sequences in a tab-delimited format instead of in FASTA format.
  bedOut:
    type: boolean?
    inputBinding:
      prefix: -bedOut
    doc: |
      Report extract sequences in a tab-delimited BED format instead of in FASTA format.
  strandedness:
    type: boolean?
    inputBinding:
      prefix: -s
    doc: |
      Force strandedness. If the feature occupies the antisense strand,
      the sequence will be reverse complemented.
      Default: strand information is ignored.
  split:
    type: boolean?
    inputBinding:
      prefix: -split
    doc: |
      Given BED12 input, extract and concatenate
      the sequences from the BED “blocks” (e.g., exons)
outputs:
  sequences:
    type: File
    outputBinding:
      glob: $(inputs.seqout)

    doc: The file containing the sequences
stdout: $(inputs.seqout)

baseCommand: [bedtools, getfasta]
doc: |
  bedtools-getfasta.cwl is developed for CWL consortium

  Original tool usage:
      Tool:    bedtools getfasta (aka fastaFromBed)
      Sources: https://github.com/arq5x/bedtools2
      Summary: Extract DNA sequences from a fasta file based on feature coordinates.
      Usage:   bedtools getfasta [OPTIONS] -fi <fasta> -bed <bed/gff/vcf>

