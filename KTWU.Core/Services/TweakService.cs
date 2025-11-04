using KTWU.Core.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using System.Threading.Tasks;

namespace KTWU.Core.Services;

public class TweakService
{
    private readonly string _manifestsPath;

    public TweakService()
    {
        // تحديد مسار مجلد التعديلات (بجانب الملف التنفيذي)
        _manifestsPath = Path.Combine(AppContext.BaseDirectory, "TweakManifests");
    }

    public async Task<List<Tweak>> GetAllTweaksAsync()
    {
        var allTweaks = new List<Tweak>();

        if (!Directory.Exists(_manifestsPath))
        {
            // يمكنك هنا إظهار رسالة خطأ للمستخدم
            return allTweaks; // إرجاع قائمة فارغة
        }

        var jsonFiles = Directory.GetFiles(_manifestsPath, "*.json");

        foreach (var file in jsonFiles)
        {
            try
            {
                string jsonContent = await File.ReadAllTextAsync(file);
                var tweaksInFile = JsonSerializer.Deserialize<List<Tweak>>(jsonContent);
                if (tweaksInFile != null)
                {
                    allTweaks.AddRange(tweaksInFile);
                }
            }
            catch (JsonException ex)
            {
                // معالجة الخطأ في حالة وجود ملف JSON تالف
                Console.WriteLine($"Error deserializing {file}: {ex.Message}");
            }
        }

        return allTweaks;
    }
}
