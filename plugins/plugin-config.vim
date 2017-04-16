" Plugin Configuration {
    for $bundle_group in g:evervim_bundle_groups
        call SourceConfigsIn($evervim_root . "/plugins/" . $bundle_group)
    endfor
" }
