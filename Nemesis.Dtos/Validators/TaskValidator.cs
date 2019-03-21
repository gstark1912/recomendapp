using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.Dtos.Validators
{
    public class TaskValidator : AbstractValidator<TaskDto>
    {
        public TaskValidator()
        {
            RuleFor(t => t.Title).NotEmpty();
            RuleFor(t => t.Start).NotNull();
            RuleFor(t => t.End).NotNull();
            RuleFor(t => t.Initiative).NotNull();
            RuleFor(t => t.Initiative.Id).NotNull().GreaterThan(0);
            RuleFor(t => t.Status).NotNull().GreaterThan(0);
           

        }
    }
}
