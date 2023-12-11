using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Приложушечка.Model;

namespace Приложушечка
{
    /// <summary>
    /// Логика взаимодействия для AddUser.xaml
    /// </summary>
    public partial class AddUser : Window
    {
        public AddUser()
        {
            InitializeComponent();
        }

        private void SaveClick(object sender, RoutedEventArgs e)
        {
            Doctors doc = new Doctors();

            doc.Birthday = DateTxb.SelectedDate.Value;
            doc.FIO = FIOTxb.Text;
            doc.Specification = SpecTxb.Text;
            doc.Otdel= OtdelTxb.Text;

            AppData.db.Doctors.Add(doc);
            AppData.db.SaveChanges();
            MessageBox.Show("Пользователь был добавлен в базу");
        }

        private void Goba_Click(object sender, RoutedEventArgs e)
        {
            Window2 winUs = new Window2();
            winUs.Show();
            this.Close();
        }
    }
}
