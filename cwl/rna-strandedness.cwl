#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: "4dndcic/4dn-rna-strandedness:v1"

- class: "InlineJavascriptRequirement"

inputs:
  fastq:
   type: File
   inputBinding:
    position: 1

  ACTB_reference:
   type: File
   inputBinding:
    position: 2

  outdir:
   type: string
   inputBinding:
    position: 3
   default: "."

outputs:
  match_count:
   type: File
   outputBinding:
    glob: "$(inputs.outdir + '/' + '*match_count.txt')"

baseCommand: ["run-rna-strandedness.sh"]
