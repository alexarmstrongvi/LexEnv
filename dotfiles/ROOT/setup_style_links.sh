#!/bin/bash

add_sym_link() {
    file_path=${1}
    file_name=$(basename $file_path)

    if [ ! -f ${file_path} ]; then
        echo "ERROR :: File does not exist: ${file_path}"
        return 1
    elif [ -L ${file_name} ]; then
        echo "ERROR :: Symlink already exists: ${file_name}"
        echo "INFO :: unlink ${file_name}"
        return 1
    fi

    ln -s ${file_path} ${file_name}
    echo "Added symlink: ${file_path} -> ${file_name}"
    
    return 0
}

function setup_style_links() {
    local atlasrootstyle_dir=${1}
    if [ -z $atlasrootstyle_dir ]; then
        echo "ERROR :: AtlasRootStyle directory must be provided as an argument"
        return 1
    elif [ ! -d $atlasrootstyle_dir ]; then
        echo "ERROR :: AtlasRootStyle directory not found: $atlasrootstyle_dir"
        return 1
    fi

    echo "INFO :: Setting up links to AtlasRootStyle files" 
    add_sym_link "${atlasrootstyle_dir}AtlasStyle.C"
    add_sym_link "${atlasrootstyle_dir}AtlasStyle.h"
    add_sym_link "${atlasrootstyle_dir}AtlasLabels.C"
    add_sym_link "${atlasrootstyle_dir}AtlasLabels.h"
    add_sym_link "${atlasrootstyle_dir}AtlasUtils.C"
    add_sym_link "${atlasrootstyle_dir}AtlasUtils.h"

    return 0
}

################################################################################
################################################################################
setup_style_links ${1}
