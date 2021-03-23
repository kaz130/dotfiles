function set_proxy() {
    export http_proxy="http://proxy.nagaokaut.ac.jp:8080"
    export https_proxy="http://proxy.nagaokaut.ac.jp:8080"
    export no_proxy="*.local, 169.254/16, *.nagaokaut.ac.jp, 133.44.*, kashiwa.nagaokaut.ac.jp"
}

function unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset no_proxy
}
