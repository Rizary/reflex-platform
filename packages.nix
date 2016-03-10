{ haskellPackages, platform }:

with haskellPackages;

[
  ##############################################################################
  # Add general packages here                                                  #
  ##############################################################################
  reflex
  reflex-dom
  reflex-todomvc
  #Craft3e
  HaXml
  OpenGL
  
  

] ++ (if platform == "ghcjs" then [
  ##############################################################################
  # Add ghcjs-only packages here                                               #
  ##############################################################################

] else []) ++ (if platform == "ghc" then [
  ##############################################################################
  # Add ghc-only packages here                                                 #
  ##############################################################################

  snap
  snap-core
  snap-server
  snap-web-routes
  snaplet-postgresql-simple
  hakyll
  #opengl
  sdl2
  hxt
  xml
  gtk3
  #Craft3e
  
  
] else []) ++ builtins.concatLists (map (x: x.override { mkDerivation = drv: drv.buildDepends; }) [ reflex reflex-dom reflex-todomvc ])
