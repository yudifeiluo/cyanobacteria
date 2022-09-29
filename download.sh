# Install using conda
conda create -n ncbi_datasets  #create a conda environment
conda activate ncbi_datasets  #activate your new environment
conda install -c conda-forge ncbi-datasets-cli  # install the datasets conda package
datasets download genome taxon cyanobacteria --assembly-source refseq --include-gbff # cyanobacteria datasets