using System.Management.Automation;
using System.Threading.Tasks;
using System.Text;

namespace KTWU.Core.Services;

public class PowerShellRunner
{
    // دالة غير متزامنة لتشغيل أمر PowerShell
    public async Task<string> RunScriptAsync(string script)
    {
        var outputBuilder = new StringBuilder();

        // استخدام 'using' لضمان إغلاق الجلسة
        using (PowerShell psInstance = PowerShell.Create())
        {
            // إضافة الأمر النصي إلى الجلسة
            psInstance.AddScript(script);

            // إضافة أمر لإخراج النتائج كنص (اختياري)
            psInstance.AddCommand("Out-String");

            // تنفيذ الأمر بشكل غير متزامن
            var psOutput = await Task.Factory.FromAsync(
                psInstance.BeginInvoke(), 
                psInstance.EndInvoke
            );

            // معالجة المخرجات
            foreach (var item in psOutput)
            {
                if (item != null)
                {
                    outputBuilder.AppendLine(item.ToString());
                }
            }

            // معالجة الأخطاء (مهم جداً)
            if (psInstance.Streams.Error.Count > 0)
            {
                foreach (var error in psInstance.Streams.Error)
                {
                    outputBuilder.AppendLine($"ERROR: {error}");
                }
            }
        }

        return outputBuilder.ToString();
    }
}
