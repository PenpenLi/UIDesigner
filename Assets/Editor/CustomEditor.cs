﻿using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using UnityEditor;
using UnityEngine;

public static class CustomEditor
{
    [MenuItem("Custom/screen shot")]
    public static void ScreenShot()
    {
        Camera uiCamera = GameObject.Find("UICamera").GetComponent<Camera>();
        Rect shootArea = new Rect();
        shootArea.position = new Vector2(0, 0);
        shootArea.width = uiCamera.orthographicSize * 2 * uiCamera.aspect;
        shootArea.height = uiCamera.orthographicSize * 2;
        CaptrueCamera(uiCamera, shootArea);

    }


    public static Texture2D CaptrueCamera(Camera camera, Rect rect)
    {
        // 创建一个RenderTexture对象
        RenderTexture rt = new RenderTexture((int)rect.width, (int)rect.height, 0);
        // 临时设置相关相机的targetTexture为rt, 并手动渲染相关相机
        RenderTexture orgrt = camera.targetTexture;
        rt.antiAliasing = 8;
        camera.targetTexture = rt;
        camera.Render();
        camera.targetTexture = orgrt;
        // 激活这个rt, 并从中中读取像素。  
        RenderTexture.active = rt;
        Texture2D screenShot = new Texture2D((int)rect.width, (int)rect.height, TextureFormat.RGB24, false);
        screenShot.ReadPixels(rect, 0, 0);// 注：这个时候，它是从RenderTexture.active中读取像素  
        screenShot.Apply();

        // 重置相关参数，以使用camera继续在屏幕上显示  
        camera.targetTexture = null;
        //ps: camera2.targetTexture = null;  
        RenderTexture.active = null; // JC: added to avoid errors  
        GameObject.DestroyImmediate(rt);
        string formatType = ".png";
        string formatTime = DateTime.Now.ToString();
        formatTime = formatTime.Replace('/', '-').Replace(' ', '-').Replace(':', '-').ToString();
        
        // 最后将这些纹理数据，成一个png图片文件  
        byte[] bytes = screenShot.EncodeToPNG();
        string filename = null;
        string path =  Path.GetFullPath(Application.dataPath + "/../ScreenShoot/");
        filename = path + formatTime + formatType; 
        if (!Directory.Exists(path))
        {
            Debug.Log("create forder " + path);
            Directory.CreateDirectory(path);
        }
        System.IO.File.WriteAllBytes(filename, bytes);
        Debug.Log(string.Format("截屏了一张照片: {0}", filename));

        return screenShot;
    } 
}
