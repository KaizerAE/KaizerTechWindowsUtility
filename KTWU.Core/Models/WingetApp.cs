using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace KTWU.Core.Models;

// نحتاج لتنفيذ INotifyPropertyChanged لربط البيانات بشكل صحيح
public class WingetApp : INotifyPropertyChanged
{
    public string Name { get; set; }
    public string Id { get; set; }
    public string Version { get; set; }

    private bool _isSelected;
    public bool IsSelected
    {
        get => _isSelected;
        set
        {
            _isSelected = value;
            OnPropertyChanged(); // إخبار الواجهة بأن هذه القيمة قد تغيرت
        }
    }

    // كود INotifyPropertyChanged القياسي
    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
