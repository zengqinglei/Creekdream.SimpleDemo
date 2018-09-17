﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Creekdream.SimpleDemo.Books.Dto;
using Creekdream.Application.Service;
using Creekdream.Application.Service.Dto;
using Creekdream.Mapping;
using Creekdream.Domain.Repositories;
using System;
using Creekdream.UnitOfWork;
using System.Linq.Expressions;
using Creekdream.Orm.Dapper;

namespace Creekdream.SimpleDemo.Books
{
    /// <inheritdoc />
    public class BookService : ApplicationService, IBookService
    {
        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly IRepository<Book, Guid> _bookRepository;

        /// <inheritdoc />
        public BookService(IUnitOfWorkManager unitOfWorkManager, IRepository<Book, Guid> bookRepository)
        {
            _unitOfWorkManager = unitOfWorkManager;
            _bookRepository = bookRepository;
        }

        /// <inheritdoc />
        public async Task<GetBookOutput> Get(Guid id)
        {
            var book = await _bookRepository.GetAsync(id);
            return book.MapTo<GetBookOutput>();
        }

        /// <inheritdoc />
        public async Task<PagedResultOutput<GetBookOutput>> GetPaged(GetPagedBookInput input)
        {
            #region dapper
            Expression<Func<Book, bool>> predicate = m => m.Name.Contains(input.Name);
            var totalCount = await _bookRepository.CountAsync(predicate);
            // dapper 分页算法会导致误差
            var books = await _bookRepository.GetPaged(
                predicate,
                input.SkipCount / input.MaxResultCount,
                input.MaxResultCount,
                input.Sorting);
            #endregion

            #region entityframework
            //var query = _bookRepository.GetQueryIncluding();
            //if (!string.IsNullOrEmpty(input.Name))
            //{
            //    query = query.Where(m => m.Name.Contains(input.Name));
            //}
            //var totalCount = await query.CountAsync();
            //var books = await query.OrderBy(input.Sorting)
            //    .Skip(input.SkipCount)
            //    .Take(input.MaxResultCount)
            //    .ToListAsync();
            #endregion

            return new PagedResultOutput<GetBookOutput>()
            {
                TotalCount = totalCount,
                Items = books.MapTo<List<GetBookOutput>>()
            };
        }

        /// <inheritdoc />
        [UnitOfWork]
        public async Task<GetBookOutput> Add(AddBookInput input)
        {
            using (var uow = _unitOfWorkManager.Begin())
            {
                var book = input.MapTo<Book>();
                book = await _bookRepository.InsertAsync(book);

                uow.Complete();

                return book.MapTo<GetBookOutput>();
            }
        }

        /// <inheritdoc />
        public async Task<GetBookOutput> Update(Guid id, UpdateBookInput input)
        {
            var book = await _bookRepository.GetAsync(id);
            input.MapTo(book);
            book = await _bookRepository.UpdateAsync(book);
            return book.MapTo<GetBookOutput>();
        }

        /// <inheritdoc />
        public async Task Delete(Guid id)
        {
            await _bookRepository.DeleteAsync(id);
        }
    }
}


