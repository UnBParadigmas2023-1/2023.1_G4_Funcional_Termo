{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_termo (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mariano/.cabal/bin"
libdir     = "/home/mariano/.cabal/lib/x86_64-linux-ghc-8.8.4/termo-0.1.0.0-inplace"
dynlibdir  = "/home/mariano/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/mariano/.cabal/share/x86_64-linux-ghc-8.8.4/termo-0.1.0.0"
libexecdir = "/home/mariano/.cabal/libexec/x86_64-linux-ghc-8.8.4/termo-0.1.0.0"
sysconfdir = "/home/mariano/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "termo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "termo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "termo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "termo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "termo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "termo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
