using BusinessObjects;
using System.ComponentModel.DataAnnotations;

namespace eStore.Models
{
    public class OrderDetailsModel : Order
    {
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Order detail Unit Price is required!!")]
        [Range(typeof(decimal), "0", "79228162514264337593543950335", ErrorMessage = "Order detail Unit Price must be a positive number!!")]
        [Display(Name = "Unit Price")]
        public decimal UnitPrice { get; set; }

        [Required(ErrorMessage = "Order detail Quantity is required!!")]
        [Range(0, int.MaxValue, ErrorMessage = "Order detail Quantity has to be a positive integer!")]
        public int Quantity { get; set; }

        [Required(ErrorMessage = "Order detail Discount is required!!")]
        [Range(0, 1, ErrorMessage = "Order detail Discount has to be between 0 and 1!")]
        public double Discount { get; set; }
        public virtual Product Product { get; set; }
    }
}
