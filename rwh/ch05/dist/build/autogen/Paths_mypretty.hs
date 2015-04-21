module Paths_mypretty (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Program Files\\Haskell\\bin"
libdir     = "C:\\Program Files\\Haskell\\x86_64-windows-ghc-7.8.3\\mypretty-0.1"
datadir    = "C:\\Program Files\\Haskell\\x86_64-windows-ghc-7.8.3\\mypretty-0.1"
libexecdir = "C:\\Program Files\\Haskell\\mypretty-0.1"
sysconfdir = "C:\\Program Files\\Haskell\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mypretty_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mypretty_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "mypretty_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mypretty_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mypretty_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
