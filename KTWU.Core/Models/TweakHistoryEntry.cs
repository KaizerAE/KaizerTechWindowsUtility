using System.ComponentModel.DataAnnotations;

namespace KTWU.Core.Models;

public class TweakHistoryEntry
{
    [Key] // هذا هو المفتاح الأساسي (Primary Key)
    public int Id { get; set; }
    
    public string TweakId { get; set; } // مثل "PERF_001"
    public string TweakTitle { get; set; }
    
    // سنقوم بتخزين قائمة "أوامر التراجع" كـ "نص JSON" واحد
    public string RevertActionsJson { get; set; } 
    
    public DateTime AppliedOn { get; set; }
}
