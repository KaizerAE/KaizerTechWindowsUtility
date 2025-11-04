using System.Text.Json.Serialization;
using System.Collections.Generic;

namespace KTWU.Core.Models;

// هذا هو الهيكل الكامل المطابق لملف JSON
// نستخدم [JsonPropertyName] لربط camelCase (في JSON) بـ PascalCase (في C#)

public class Tweak
{
    [JsonPropertyName("id")]
    public string Id { get; set; }

    [JsonPropertyName("title")]
    public string Title { get; set; }

    [JsonPropertyName("description")]
    public string Description { get; set; }

    [JsonPropertyName("category")]
    public string Category { get; set; }

    [JsonPropertyName("targetOS")]
    public List<string> TargetOS { get; set; }

    [JsonPropertyName("isDangerous")]
    public bool IsDangerous { get; set; }

    [JsonPropertyName("actions")]
    public TweakActions Actions { get; set; }
}

public class TweakActions
{
    [JsonPropertyName("apply")]
    public List<TweakAction> Apply { get; set; }

    [JsonPropertyName("revert")]
    public List<TweakAction> Revert { get; set; }
}

public class TweakAction
{
    [JsonPropertyName("type")]
    public string Type { get; set; } // "powershell" or "registry"

    [JsonPropertyName("command")]
    public string Command { get; set; } // For powershell type

    [JsonPropertyName("path")]
    public string Path { get; set; } // For registry type

    [JsonPropertyName("name")]
    public string Name { get; set; } // For registry type

    [JsonPropertyName("value")]
    public object Value { get; set; } // For registry type

    [JsonPropertyName("valueType")]
    public string ValueType { get; set; } // For registry type
}
