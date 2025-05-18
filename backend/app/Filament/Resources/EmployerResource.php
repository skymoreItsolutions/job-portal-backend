<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmployerResource\Pages;
use App\Filament\Resources\EmployerResource\RelationManagers;
use App\Models\Employer;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\ToggleColumn;


class EmployerResource extends Resource
{
    protected static ?string $model = Employer::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('company_name')
                ->required()
                ->maxLength(255),

            TextInput::make('company_location')
                ->required()
                ->maxLength(255),

            TextInput::make('contact_person')
                ->required()
                ->maxLength(255),

            TextInput::make('contact_email')
                ->email()
                ->required()
                ->maxLength(255),

            TextInput::make('contact_phone')
                ->tel()
                ->required()
                ->maxLength(20),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
         ->defaultSort('id', 'desc')
            ->columns([
              TextColumn::make('serial')
    ->label('S.No')
    ->state(
        fn ($record, $livewire) =>
            ($livewire->getTableRecordsPerPage() * ($livewire->getTablePage() - 1)) + $livewire->getTableRecords()->search(fn ($r) => $r->getKey() === $record->getKey()) + 1
    ),
                  ToggleColumn::make('is_verified')
                ->label('Verified')
                ->sortable()
                ->onColor('success')
                ->offColor('danger')
                ->afterStateUpdated(function ($record, $state) {
            
                }),
                ToggleColumn::make('is_blocked')
                ->label('Blocked')
                ->sortable()
                ->onColor('danger')
                ->offColor('success')
                ->afterStateUpdated(function ($record, $state) {
                   }),
             
                TextColumn::make('company_name')->sortable()->searchable(),
                TextColumn::make('company_location')->sortable()->searchable(),
                TextColumn::make('contact_person')->sortable()->searchable(),
                TextColumn::make('contact_email')->sortable()->searchable(),
                TextColumn::make('contact_phone')->sortable()->searchable(),
              
            ])
            ->filters([
                 Tables\Filters\TernaryFilter::make('is_verified')
        ->label('Verified'),

    Tables\Filters\TernaryFilter::make('is_blocked')
        ->label('Blocked'),

    Tables\Filters\Filter::make('company_name')
        ->form([
            TextInput::make('company_name'),
        ])
        ->query(function (Builder $query, array $data) {
            return $query
                ->when($data['company_name'], fn ($q) =>
                    $q->where('company_name', 'like', '%' . $data['company_name'] . '%'));
        }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEmployers::route('/'),
            'create' => Pages\CreateEmployer::route('/create'),
            'edit' => Pages\EditEmployer::route('/{record}/edit'),
        ];
    }
}