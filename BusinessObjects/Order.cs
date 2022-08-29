using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace BusinessObjects
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderId { get; set; }
        [Display(Name = "Member")]
        public string MemberId { get; set; }

        [Required(ErrorMessage = "Order Date is required!!")]
        [DataType(DataType.DateTime)]
        [Display(Name = "Order Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        public DateTime OrderDate { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Required Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        public DateTime? RequiredDate { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Shipped Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]
        public DateTime? ShippedDate { get; set; }
        public decimal? Freight { get; set; }

        public bool IsDeleted { get; set; }

        public virtual Member Member { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
