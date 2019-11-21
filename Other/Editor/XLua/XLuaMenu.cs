﻿using UnityEngine;
using UnityEditor;
using System.IO;
using Debug = UnityEngine.Debug;
using AssetBundles;
using System.Diagnostics;

[InitializeOnLoad]
public static class XLuaMenu
{
    [MenuItem("XLua/Copy Lua Files To AssetsPackage", false, 51)]
    public static void CopyLuaFilesToAssetsPackage()
    {
        bool encodeLua = true;  //对lua 编译

        //准备目标路径
        string destination = Path.Combine(Application.dataPath, AssetBundleConfig.AssetsFolderName);
        destination = Path.Combine(destination, XLuaManager.luaAssetbundleAssetName);
 
        //准备源目录
        string source = "";
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            source = Path.Combine(Application.dataPath, XLuaManager.luaScriptsFolder);
        }
        else if (Application.platform == RuntimePlatform.OSXEditor)
        {
            if (encodeLua)
            {
                source = Path.Combine(Application.dataPath, "LuaScriptsEncode");
            }
            else
            {
                source = Path.Combine(Application.dataPath, XLuaManager.luaScriptsFolder);
            }
        }
        if(source.Length == 0)
        {
            Debug.LogError("Source error:"+ source);
            return;
        }
        //先删除后copy 否则会失败
        GameUtility.SafeDeleteDir(destination);
        FileUtil.CopyFileOrDirectoryFollowSymlinks(source, destination);
        //清理非Lua文件
        var notLuaFiles = GameUtility.GetSpecifyFilesInFolder(destination, new string[] { ".lua" }, true);
        if (notLuaFiles != null && notLuaFiles.Length > 0)
        {
            for (int i = 0; i < notLuaFiles.Length; i++)
            {
                GameUtility.SafeDeleteFile(notLuaFiles[i]);
            }
        }
        //获取所有的lua文件准备编译
        var luaFiles = GameUtility.GetSpecifyFilesInFolder(destination, new string[] { ".lua" }, false);
        if (luaFiles != null && luaFiles.Length > 0)
        {
            for (int i = 0; i < luaFiles.Length; i++)
            {
                if (encodeLua)
                {
                    if (Application.platform == RuntimePlatform.WindowsEditor)
                    {
                        // window 平台直接编译
                        EncodeLuaFile(luaFiles[i], luaFiles[i] + ".bytes");
                        GameUtility.SafeDeleteFile(luaFiles[i]);
                    }
                    else if (Application.platform == RuntimePlatform.OSXEditor)
                    {
                        // mac 平台，lua_encode.py编译好的文件复制过来,直接重命名
                          GameUtility.SafeRenameFile(luaFiles[i], luaFiles[i] + ".bytes");
                    }
                    
                }
                else
                {
                    GameUtility.SafeRenameFile(luaFiles[i], luaFiles[i] + ".bytes");
                }
                
            }
        }

        AssetDatabase.Refresh();
        Debug.Log("Copy lua files over");
    }

    [MenuItem("XLua/Lua Encode4Editor", false, 52)]
    public static void Encode4Editor()
    {

        string destination = Path.Combine(Application.dataPath, "LuaScriptsEncode");
        string source = Path.Combine(Application.dataPath, XLuaManager.luaScriptsFolder);
        GameUtility.SafeDeleteDir(destination);

        FileUtil.CopyFileOrDirectoryFollowSymlinks(source, destination);

        var luaFiles = GameUtility.GetSpecifyFilesInFolder(destination, new string[] { ".lua" }, false);
        if (luaFiles != null && luaFiles.Length > 0)
        {
            for (int i = 0; i < luaFiles.Length; i++)
            {
                GameUtility.SafeDeleteFile(luaFiles[i]);
                EncodeLuaFile(luaFiles[i].Replace("LuaScriptsEncode", XLuaManager.luaScriptsFolder), luaFiles[i]);

            }
        }

        AssetDatabase.Refresh();
        Debug.Log("Encode lua files over");
    }

    public static void EncodeLuaFile(string srcFile , string outFile)
    {
        bool isWin = true;
        string luaexe = string.Empty;
        string args = string.Empty;
        string exedir = string.Empty;
        string currDir = Directory.GetCurrentDirectory();

        if(Application.platform == RuntimePlatform.WindowsEditor)
        {
            isWin = true;
            luaexe = "luac.exe";
            args = " -s -o " + outFile.Replace('\\', '/') + " " + srcFile.Replace('\\', '/');
            exedir = Application.dataPath.Replace("Assets", "") + "Tools/luaCompileWin/";
            exedir.Replace('\\', '/');
        }else if(Application.platform == RuntimePlatform.OSXEditor)
        {
            isWin = false;
            luaexe = "./luac";
            args = " -s -o " + outFile.Replace('\\', '/') + " " + srcFile.Replace('\\', '/');
            exedir = Application.dataPath.Replace("Assets", "") + "Tools/luaCompileMac/";
            exedir.Replace('\\', '/');
        }

        Directory.SetCurrentDirectory(exedir);
        ProcessStartInfo info = new ProcessStartInfo();
        info.FileName = luaexe;
        info.Arguments = args;
        info.WindowStyle = ProcessWindowStyle.Hidden;
        info.UseShellExecute = isWin;
        info.ErrorDialog = true;

        Process pro = Process.Start(info);
        pro.WaitForExit();
        Directory.SetCurrentDirectory(currDir);

    }
}
