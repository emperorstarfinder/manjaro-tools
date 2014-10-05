#!/bin/bash
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# cp_profile_pkgs(){
#     for pkg in $(cat ${profiledir}/$1.set); do
# 	cp_pkg $pkg
#     done
# }
#
# cp_pkg(){
#     msg2 "Copying $1 to ${pkgdir}"
#     cd $1
#     cp ${misc_args[*]} *.pkg.tar.xz ${pkgdir}
#     cd ..
# }
#
# cp_pkgs(){
#     msg "Copying packages ..."
#     eval "case ${profile} in
# 	$profiles)
# 	    cp_profile_pkgs ${profile}
# 	;;
# 	*)
# 	    cp_pkg ${profile}
# 	;;
#     esac"
#     msg "Finished copying"
# }

repo_create(){
    cd ${pkgdir}
    repo-add ${pkgdir##*/}.db.tar.xz *.pkg.tar.xz
    cd ..
}

#cp_pkgs ${profile}

if ${repo}; then
    cd ${pkgdir}
    repo_create
    cd ..
fi

if ${sign}; then
    cd ${pkgdir}
    signpkgs
    cd ..
fi