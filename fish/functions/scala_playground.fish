function scala_playground --description 'opens an ammonite shell with http4s and cats/cats-effect installed'
    scala-cli repl -A -S 2.13 -d org.http4s::http4s-client:0.23
end
