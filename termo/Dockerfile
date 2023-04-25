FROM haskell:9.4.3-buster

WORKDIR /termo_project

COPY . .

RUN stack build --install-ghc

ENTRYPOINT ["stack","exec","termo-exe"]