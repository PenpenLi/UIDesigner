﻿using UnityEngine;
using System.Collections.Generic;
using XLua;
using System.IO;
using System.Text;
using System.Linq;
using CSObjectWrapEditor;
using UnityEditor;

public class ComItem
{
    public string com_var_name;
    public string com_type_name;
    public string com_path_name;
}

/// <summary>
/// 生成UI 模板
/// 操作方法：  
/// 1， 将 UI界面的prefab 拖入Hierarchy
/// 2,  在Hierarchy中右键点击MVC子菜单下的相关生成项
/// 
/// 要求：
/// 1， prefab 名字中不能带下划线
/// 2， 如果需要生成AddCommponent代码，在相应的GameObjet名字中添加_UIxx
///     比如prefab中button所在gameobject名为：selectServerBtn, 如果要自动
///     生成组件代码，请将按钮改名为： selectServerBtn_UIButton
/// 3,  支持的组件请查看UIMVCGen下的comTypes 数组
/// 
/// </summary>
public class UIMVCGen
{
    public static string output_dir = Application.dataPath + "/LuaScripts/UI/";

    public static string tpl_model = "Assets/Editor/UI/Template/UIModelGen.tpl.txt";
    public static string tpl_view = "Assets/Editor/UI/Template/UIViewGen.tpl.txt";
    public static string tpl_controller = "Assets/Editor/UI/Template/UIControllerGen.tpl.txt";
    public static string tpl_config = "Assets/Editor/UI/Template/UIConfigGen.tpl.txt";

    public static List<string> comTypes = new List<string> {
        "UIButton","UIButtonGroup","UICanvas","UIImage","UIInput","UILayer",
        "UISlider","UITabGroup","UIText","UIToggleButton","UIWrapComponent"
    };
    public static bool checkComType(string comType)
    {
        return comType.Contains(comType);
    }

    public static string GetTransPath(string rootName, Transform trans)
    {
        if (null == trans) return string.Empty;
        if (trans.parent!=null && trans.parent.name.Equals(rootName)) return trans.name;

        return GetTransPath(rootName, trans.parent) + "/" + trans.name;
    }

    public static void FindChild(string rootName,Transform trans, List<ComItem> list)
    {
        string name = trans.name;
        int lastUnderLine = name.LastIndexOf('_');

        if(lastUnderLine > 0)
        {
            string comName = name.Substring(0, lastUnderLine);
            string comType = name.Substring(lastUnderLine+1);

            if (comType != "" && checkComType(comType))
            {
                ComItem item = new ComItem();
                if (comName .Length >1)
                {
                    string firstLetter = comName[0].ToString();
                    string lastLatters = comName.Substring(1);
                    item.com_var_name = string.Format("{0}{1}", firstLetter.ToLower(), lastLatters); 
                }
                else
                {
                    item.com_var_name = comName.ToLower();
                }
                item.com_type_name = comType;
                item.com_path_name = GetTransPath(rootName,trans);
                list.Add(item);
            }
        }

        for(int i=0; i< trans.childCount; i++)
        {
            FindChild(rootName, trans.GetChild(i), list);
        }
    }
    /// <summary>
    /// 生成UI模板
    /// </summary>
    public static void GenUITemplate(string moduleName, string templatePath, string outputPath)
    {
        EditorUtility.DisplayProgressBar("生成中...", "生成模板...", 20);
        TextAsset ta = AssetDatabase.LoadAssetAtPath<TextAsset>(templatePath);

        Generator.GetTasks tasks = null;
        List<ComItem> comList = new List<ComItem>();

        Transform trans = Selection.activeTransform;
        if (trans != null && !trans.name.Contains("_"))
        {
            FindChild(trans.name, trans, comList);

        }
        else
        {
            Logger.LogError("prefab 名字为空或名字中带下划线，请规范命名！");
        }

        tasks += (lua_env, user_cfg) =>
        {

            LuaTable data = lua_env.NewTable();
            data.Set("module_name", moduleName);
            data.Set("model_class_name", moduleName + "Model");
            data.Set("view_class_name", moduleName + "View");
            data.Set("controller_class_name", moduleName + "Ctrl");
            data.Set("config_class_name", moduleName + "Config");

            data.Set("com_list", comList);


            List<CustomGenTask> list = new List<CustomGenTask>();
            CustomGenTask task = new CustomGenTask
            {
                Data = data,
                Output = new StreamWriter(outputPath,
                false, new UTF8Encoding(false))
            };
            list.Add(task);

            return list;
        };

        Generator.CustomGen(ta.text, tasks);
        EditorUtility.ClearProgressBar();
        AssetDatabase.Refresh();
    }

    /// <summary>
    /// 生成位置坐标模板
    /// </summary>
    public static void GenLevelTemplate(string moduleName, string templatePath, string outputPath)
    {
        EditorUtility.DisplayProgressBar("生成中...", "生成模板...", 20);
        TextAsset ta = AssetDatabase.LoadAssetAtPath<TextAsset>(templatePath);

        Generator.GetTasks tasks = null;
        List<ComItem> comList = new List<ComItem>();

        Transform trans = Selection.activeTransform;
        if (trans != null && !trans.name.Contains("_"))
        {
            FindChild(trans.name, trans, comList);

        }
        else
        {
            Logger.LogError("prefab 名字为空或名字中带下划线，请规范命名！");
        }

        tasks += (lua_env, user_cfg) =>
        {

            LuaTable data = lua_env.NewTable();

            data.Set("leveldata_name", moduleName + "LevelData");

            data.Set("com_list", comList);


            List<CustomGenTask> list = new List<CustomGenTask>();
            CustomGenTask task = new CustomGenTask
            {
                Data = data,
                Output = new StreamWriter(outputPath,
                false, new UTF8Encoding(false))
            };
            list.Add(task);

            return list;
        };

        Generator.CustomGen(ta.text, tasks);
        EditorUtility.ClearProgressBar();
        AssetDatabase.Refresh();
    }



    [MenuItem("GameObject/MVC/Gen MVC", priority = 10)]
    public static void GenUIMVC()
    {
        GenUIModel();
        GenUIView();
        GenUIController();
        GenUIConfig();

    }

    [MenuItem("GameObject/MVC/Gen M", priority = 11)]
    public static void GenUIModel()
    {
        Transform trans = Selection.activeTransform;
        if (trans == null) return;

        string pagePath = output_dir + trans.name + "/Model";
        if (!Directory.Exists(pagePath)) Directory.CreateDirectory(pagePath);

        string modelPath = pagePath + "/" + trans.name + "Model.lua";
        if (File.Exists(modelPath))
        {
            Logger.LogError("lua file in path:{0} is existed.", modelPath);
            return;
        }

        GenUITemplate(trans.name,tpl_model,modelPath);
    }

    [MenuItem("GameObject/MVC/Gen V", priority = 12)]
    public static void GenUIView()
    {
        Transform trans = Selection.activeTransform;
        if (trans == null) return;

        string pagePath = output_dir + trans.name + "/View";
        if (!Directory.Exists(pagePath)) Directory.CreateDirectory(pagePath);

        string viewPath = pagePath + "/" + trans.name + "View.lua";
        if (File.Exists(viewPath))
        {
            Logger.LogError("lua file in path:{0} is existed.", viewPath);
            return;
        }

        GenUITemplate(trans.name, tpl_view, viewPath);
    }

    [MenuItem("GameObject/MVC/Gen C", priority = 13)]
    public static void GenUIController()
    {
        Transform trans = Selection.activeTransform;
        if (trans == null) return;

        string pagePath = output_dir + trans.name + "/Controller";
        if (!Directory.Exists(pagePath)) Directory.CreateDirectory(pagePath);

        string ctrlPath = pagePath + "/" + trans.name + "Ctrl.lua";
        if (File.Exists(ctrlPath))
        {
            Logger.LogError("lua file in path:{0} is existed.", ctrlPath);
            return;
        }

        GenUITemplate(trans.name, tpl_controller, ctrlPath);
    }

    [MenuItem("GameObject/MVC/Gen Config", priority = 14)]
    public static void GenUIConfig()
    {
        Transform trans = Selection.activeTransform;
        if (trans == null) return;

        string pagePath = output_dir + trans.name ;
        if (!Directory.Exists(pagePath)) Directory.CreateDirectory(pagePath);

        string configPath = pagePath + "/" + trans.name + "Config.lua";
        if (File.Exists(configPath))
        {
            Logger.LogError("lua file in path:{0} is existed.", configPath);
            return;
        }

        GenUITemplate(trans.name, tpl_config, configPath);
    }
    struct levelPos
    {
        float x;
        float y;
    }
    [MenuItem("GameObject/MVC/关卡地图位置坐标", priority = 14)]
    public static void GenUILevel()
    {
        Transform trans = Selection.activeTransform;
        if (trans == null) return;
        string pagePath = output_dir+ "UILevelMain";
        if (!Directory.Exists(pagePath)) Directory.CreateDirectory(pagePath);
        string configPath = pagePath + "/UILevelItemPosData.lua";

        string namekey;
        //Dictionary<int,>
        string key;
        string content;
        List<string> levelList = new List<string>();
        List<string> lineList = new List<string>();
        Encoding flag = Encoding.Unicode;
        File.WriteAllText(configPath, "local levelmapdata = {\n", flag);
        for (int i = 0; i < trans.childCount; i++)
        {
            Transform transchild = trans.GetChild(i);

                namekey = transchild.name.Substring(0,7);
 
            if (namekey == "UILevel")
                {
                    key = transchild.name.Substring(7, transchild.name.Length-7);
                    levelList.Clear();
                    lineList.Clear();
                    for (int ik = 0; ik < transchild.childCount; ik++)
                    {
                        Transform transcc = transchild.GetChild(ik);
                        namekey = transcc.name.Substring(0, 5);
                        if (namekey == "level")
                        {
                            content = string.Format("{{{0:N2},{1:N2}}}", transcc.localPosition.x, transcc.localPosition.y);
                           // Debug.LogError(transcc.name + ":" + content);
                            levelList.Add(content);
                        }
                        if (transcc.name.Length > 7)
                        {
                            namekey = transcc.name.Substring(0, 7);
                            if (namekey == "preline")
                            {
                                content = string.Format("{{{0:N2},{1:N2}}}", transcc.localPosition.x, transcc.localPosition.y);
                               // Debug.LogError(transcc.name + ":" + content);
                                lineList.Add(content);
                            }
                        }
                    }
                    if(levelList.Count >0 && lineList.Count >0)
                    {
                        content = "";
                        for (int k = 0; k < levelList.Count -1; k++)
                        {
                        content += levelList[k];
                        content += ",";
                        }
                        content += levelList[levelList.Count-1];
                        string c1 = string.Format("leveldata={{{1}}}", key, content);
                    content = "";
                        for (int k = 0; k < lineList.Count - 1; k++)
                        {
                            content += lineList[k];
                            content += ",";
                        }
                        content += lineList[lineList.Count - 1];
                    string c2 = string.Format("linepos={{{1}}}", key, content);
                    string str = string.Format("[{0}]={{\n{1},\n{2}\n}},\n", key, c1, c2);
                    File.AppendAllText(configPath, str, flag);
                    Debug.Log(str);
                }
                    
                }
         }
        File.AppendAllText(configPath, "}\n", flag);
        File.AppendAllText(configPath, "SetLooseReadonly(levelmapdata)\n", flag);
        File.AppendAllText(configPath, "return levelmapdata", flag);
    }
}
