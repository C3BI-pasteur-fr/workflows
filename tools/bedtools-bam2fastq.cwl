#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: bedtools
label: BEDTools is an extensive suite of utilities for comparing genomic features
  in BED format.
doc: |+
  BEDTools is an extensive suite of utilities for comparing genomic features in BED format.

  External links:
  Tool homepage: http://bedtools.readthedocs.io/en/latest/content/tools/bamtofastq.html?highlight=bam2fastq
  bio.tools entry: bedtools

hints:
  SoftwareRequirement:
    packages:
      bedtools:
        version: ["2.25.0"]

$namespaces:
  edam: https://edamontology.org/
  s: http://schema.org/
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


baseCommand: [bedtools, bamtofastq]

inputs:
  input:
    type: File
    format: edam:format_2572
    inputBinding:
      prefix: '-i'
      valueFrom: |
        ${
          var prefix = ((/.*\.bam$/i).test(inputs.input.path))?'-ibam':'-i';
          return [prefix,inputs.input.path];
        }
  fq:
    type: string
    inputBinding:
      prefix: '-fq'
  fq2:
    type: string?
    inputBinding:
      prefix: '-fq2'

outputs:
  fastq_r1:
    type: File
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq)
  fastq_r2:
    type: ["null", File]
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq2)


s:about: BEDTools is an extensive suite of utilities for comparing genomic features
  in BED format.
s:keywords: [edam:topic_0622]
s:name: BEDTools
s:programmingLanguage: [C++]
s:publication:
- {id: http://dx.doi.org/10.1093/bioinformatics/btq033}
s:url: https://github.com/arq5x/bedtools2