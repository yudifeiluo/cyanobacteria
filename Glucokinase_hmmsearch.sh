#!/bin/bash


a=$(ls *.pep.fa)
hmm=$(ls *.hmm)

for j in ${a}
do
    pep=`basename ${j}`
    echo "We have pep files ${pep}"

    for i in ${pep}
    do
        echo "now we use hmmsearch tool to search ${hmm} against ${i}"
        hmmsearch -o ${i}.hmmout -E 1e-20 ${hmm} ${i}
        echo "    extract gene name from ${i}.hmmout"
        cat ${i}.hmmout | awk 'NR==19 { print }' | sed 's/    /  /g' | sed 's/   /  /g' | sed 's/  / /g' | awk -v i=$i '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,i }' > ${i}.hmmout.inf
        echo "    ${i} file processing are completed and generate ${i}.seqid and ${i}.proseq."
    done

done
