using Avtorizaciya;
using Microsoft.Office.Interop.Word;
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
using Word = Microsoft.Office.Interop.Word;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using System;
using System.Data.SqlClient;
using System.Windows;
using Microsoft.Win32;

namespace Приложушечка
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : System.Windows.Window
    {
        MedTestEntities db = new MedTestEntities();
        public Window1()
        {
            InitializeComponent();

            if (MainWindow.Globals.Role == 1)
            {
                AddBtn.Visibility = Visibility.Visible;
                EditBtn.Visibility = Visibility.Visible;
                RemoveBtn.Visibility = Visibility.Visible;
                Vostav.Visibility = Visibility.Visible;
                Rezerv.Visibility = Visibility.Visible;
            }
            else
            {
                AddBtn.Visibility = Visibility.Collapsed;
                EditBtn.Visibility = Visibility.Collapsed;
                RemoveBtn.Visibility = Visibility.Collapsed;
                Vostav.Visibility = Visibility.Collapsed;
                Rezerv.Visibility = Visibility.Collapsed;
            }
        }

        private void sotrudnichki_Click(object sender, RoutedEventArgs e)
        {
            Window2 win2 = new Window2();
            win2.Show();
            this.Close();
        }

        private void prikazy_Click(object sender, RoutedEventArgs e)
        {
            Window3 win3 = new Window3();
            win3.Show();
            this.Close();
        }

        private void otchety_Click(object sender, RoutedEventArgs e)
        {
            Window4 win4 = new Window4();
            win4.Show();
            this.Close();
        }

        private void raspisanye_Click(object sender, RoutedEventArgs e)
        {
            Window5 win5 = new Window5();
            win5.Show();
            this.Close();
        }

        private void settings_Click(object sender, RoutedEventArgs e)
        {
            Window6 win6 = new Window6();
            win6.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            UsersGrid.ItemsSource = AppData.db.Information.ToList();
        }
        private void Add_Btn_Click(object sender, RoutedEventArgs e)
        {
            AddBtn win7 = new AddBtn();
            win7.Show();
            this.Close();
        }

        private void Add_Btn_Click11(object sender, RoutedEventArgs e)
        {
            if (UsersGrid.SelectedItem != null)
            {
                Edit1 edit = new Edit1(UsersGrid.SelectedItem as Приложушечка.Model.Information);
                edit.ShowDialog();
                AppData.db.SaveChanges();
            }
            else
            {
                MessageBox.Show("Выбирете пользователя");
            }
            MedTestEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
        }

        private void RemoveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите удалить пациента?", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                var CurrectPac = UsersGrid.SelectedItem as Приложушечка.Model.Information;
                AppData.db.Information.Remove(CurrectPac);
                AppData.db.SaveChanges();

                UsersGrid.ItemsSource = AppData.db.Information.ToList();
                MessageBox.Show("Успешно");
            }
        }

        private void Export_Click(object sender, RoutedEventArgs e)
        {
            var allZep = MedTestEntities.GetContext().Information.ToList();
            var allpac = MedTestEntities.GetContext().Information.ToList();

            var appl = new Word.Application();

            Word.Document document = appl.Documents.Add();

            Word.Paragraph userParagraph = document.Paragraphs.Add();
            Word.Range userRange = userParagraph.Range;
            userRange.Text = "Отчёт о пациентах";

            userRange.InsertParagraphAfter();

            Word.Paragraph tableParagraph = document.Paragraphs.Add();
            Word.Range tableRange = tableParagraph.Range;
            Word.Table paymentsTable = document.Tables.Add(tableRange, allZep.Count() + 1, 7);
            paymentsTable.Borders.InsideLineStyle = paymentsTable.Borders.OutsideLineStyle
                = Word.WdLineStyle.wdLineStyleSingle;
            paymentsTable.Range.Cells.VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;

            Word.Range cellRange;

            cellRange = paymentsTable.Cell(1, 1).Range;
            cellRange.Text = "ID";
            cellRange = paymentsTable.Cell(1, 2).Range;
            cellRange.Text = "ФИО пациента";
            cellRange = paymentsTable.Cell(1, 3).Range;
            cellRange.Text = "Номер в базе";
            cellRange = paymentsTable.Cell(1, 4).Range;
            cellRange.Text = "Дата поступления";
            cellRange = paymentsTable.Cell(1, 5).Range;
            cellRange.Text = "История лечения";
            cellRange = paymentsTable.Cell(1, 6).Range;
            cellRange.Text = "Статус";
            cellRange = paymentsTable.Cell(1, 7).Range;
            cellRange.Text = "День рождения";


            paymentsTable.Rows[1].Range.Bold = 1;
            paymentsTable.Rows[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

            for (int i = 0; i < allZep.Count(); i++)
            {
                var currentCategory = allZep[i];
                cellRange = paymentsTable.Cell(i + 2, 1).Range;
                cellRange.Text = Convert.ToString(currentCategory.ID);
                cellRange.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

                cellRange = paymentsTable.Cell(i + 2, 2).Range;
                cellRange.Text = Convert.ToString(currentCategory.FIO);

                cellRange = paymentsTable.Cell(i + 2, 3).Range;
                cellRange.Text = Convert.ToString(currentCategory.Gender);

                cellRange = paymentsTable.Cell(i + 2, 4).Range;
                cellRange.Text = Convert.ToString(currentCategory.DateRecive.ToString("dd.MM.yyyy"));

                cellRange = paymentsTable.Cell(i + 2, 5).Range;
                cellRange.Text = Convert.ToString(currentCategory.History);

                cellRange = paymentsTable.Cell(i + 2, 6).Range;
                cellRange.Text = Convert.ToString(currentCategory.Status);

                cellRange = paymentsTable.Cell(i + 2, 7).Range;
                cellRange.Text = currentCategory.Birthday.ToString("dd.MM.yyyy");
            }

            appl.Visible = true;
        }

        private void Rezerv_click(object sender, RoutedEventArgs e)
        {
            {
                {
                    string serverName = ".";
                    string databaseName = "MedTest";
                    string backupPath = "C:\\555.bak";

                    ServerConnection serverConnection = new ServerConnection(serverName);
                    Server server = new Server(serverConnection);
                    Backup backup = new Backup() { Action = BackupActionType.Database, Database = databaseName };
                    backup.Devices.AddDevice(backupPath, DeviceType.File);
                    backup.Initialize = true;
                    try
                    {
                        backup.SqlBackup(server);
                        MessageBox.Show("Копия успешно сохранена", "Статус копирования", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ошибка создания файла: " + ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
        }

        private void Vostav_click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Database Files (*.bak)|*.bak";
                if (openFileDialog.ShowDialog() == true)
                {
                    string databaseFileName = openFileDialog.FileName;

                    string connectionString = "Data Source=LANA-PC;Initial Catalog=master;Integrated Security=True;";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = $"ALTER DATABASE MedTest SET SINGLE_USER WITH ROLLBACK IMMEDIATE; RESTORE DATABASE MedTest FROM DISK = '{databaseFileName}' WITH REPLACE; ALTER DATABASE MedTest SET MULTI_USER";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.ExecuteNonQuery();
                        }
                    }

                    MessageBox.Show("Резервное копирование успешно выполнено");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }
    }
}
